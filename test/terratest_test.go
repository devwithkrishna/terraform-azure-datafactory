// Edit this file to add your own tests
// rename the file as <something>_test.go to be recognized by `go test` command.
// For more details, refer https://golang.org/pkg/testing/
package test

import (
	"os"
	"strings"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// GenerateRandomString generates a random string of specified length using terratest's random package.
// Helper function — reusable in any test
func GenerateRandomString() string {
	return random.UniqueId()
}

// TestAzureCredentialsProvided verifies required Azure env vars for Terratest auth are set.
func ValidateAzureCredentials(t *testing.T) {
	required := []string{
		"ARM_CLIENT_ID",
		"ARM_CLIENT_SECRET",
		"ARM_SUBSCRIPTION_ID",
		"ARM_TENANT_ID",
	}

	for _, name := range required {
		val, ok := os.LookupEnv(name)
		require.Truef(t, ok && val != "", "environment variable %s must be set and non-empty", name)
	}
}

func TestAzureDataFactory(t *testing.T) {
	t.Parallel()
	randomString := GenerateRandomString()
	t.Logf("Generated random string: %s", randomString)
	// 🔹 Step 1: Validate credentials first
	ValidateAzureCredentials(t)
	resourceGroupName := "rg-adf-" + randomString
	t.Logf("Generated resource group name: %s", resourceGroupName)

	terraformOptions := &terraform.Options{
		// Path to the example usage of the module
		TerraformDir: "../examples/sample",

		Vars: map[string]interface{}{
			"resource_group_name": resourceGroupName,
			"location":            "centralindia",
			"data_factory_name":   resourceGroupName + "-df",

			// module tags/metadata
			"environment":                     "DEV",
			"application_name":                "devwithkrishna",
			"temporary":                       "TRUE",
			"managed_virtual_network_enabled": false,
			"public_network_enabled":          true,
		},

		// Retry settings: Azure sometimes needs extra time for provisioning
		MaxRetries:         3,
		TimeBetweenRetries: 10 * time.Second,
	}

	// ensure cleanup
	defer terraform.Destroy(t, terraformOptions)

	// init + apply
	terraform.InitAndApply(t, terraformOptions)

	// read outputs
	rgOut := terraform.Output(t, terraformOptions, "resource_group_name")
	datafactoryNameOut := terraform.Output(t, terraformOptions, "data_factory_name")
	publicAccessOut := terraform.Output(t, terraformOptions, "public_access_enabled")
	dataFactoryIdout := terraform.Output(t, terraformOptions, "data_factory_id")
	tags := terraform.OutputMap(t, terraformOptions, "datafactory_tags")
	t.Logf("Datafactory Resource Id: %s", dataFactoryIdout)
	t.Logf("Outputs: resourceGroup=%s, DataFactory=%s, DataFactoryId=%s, PublicAccessEnabled=%s", rgOut, datafactoryNameOut, dataFactoryIdout, publicAccessOut)

	// basic assertions
	assert.Equal(t, resourceGroupName, rgOut)
	assert.NotEqual(t, resourceGroupName, datafactoryNameOut)
	assert.NotEmpty(t, dataFactoryIdout)
	// checking datafactory resource id contains expected substrings
	assert.True(t, strings.Contains(dataFactoryIdout, "/Microsoft.DataFactory/factories/"))
	// checking datafactory name contains expected substrings
	assert.Contains(t, datafactoryNameOut, "df", "Expected Data Factory name to contain 'df'")
	// assert.True(t, publicAccessOut, "Expected public access to be enabled")

	// ✅ Check that required tags exist
	assert.Contains(t, tags, "Environment", "Expected tag 'Environment' to be present")
	assert.Contains(t, tags, "ApplicationName", "Expected tag 'ApplicationName' to be present")

	// Optional: Check tag values
	assert.Equal(t, "DEV", tags["Environment"], "Expected environment=DEV")

}
