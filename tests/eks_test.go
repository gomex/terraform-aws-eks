package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestElasticacheExample(t *testing.T) {

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
