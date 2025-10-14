// Edit this file to add your own tests
// rename the file as <something>_test.go to be recognized by `go test` command.
// For more details, refer https://golang.org/pkg/testing/
package test

import (
	"os"
	"testing"

	"github.com/stretchr/testify/require"
)

// TestAzureCredentialsProvided verifies required Azure env vars for Terratest auth are set.
func TestAzureCredentialsProvided(t *testing.T) {
	t.Parallel()

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

// TestTerraformModulePlaceholder is a placeholder for future Terratest integration tests.
// Replace the body with actual terraform.Options, InitAndApply, assertions, and defer Destroy.
func TestTerraformModulePlaceholder(t *testing.T) {
	t.Parallel()
	t.Skip("placeholder test - implement terraform apply/destroy tests here")
}
