resource "aws_wafv2_web_acl" "waf" {                 #Creating the WAF ACL
  name  = var.waf_name
  scope = "REGIONAL"
   
  default_action {                                        # Default Action - Allowing Requests by Default
    allow {}
  }

  rule {                                                   #Defining a Security Rule Using AWS Managed Rules
    name     = "AWSCommonRules"
    priority = 1

    override_action {                                      #Override Action - No Custom Action
      none {}
    }

    statement {                                             #Using AWS Managed Rule Sets
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesCommonRuleSet"
      }
    }

    visibility_config {                                     #Enabling CloudWatch Monitoring for Rule Activity
      cloudwatch_metrics_enabled = true
      metric_name                = "aws_common_rules"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {                                     #Overall Visibility Config for WAF ACL
    cloudwatch_metrics_enabled = true
    metric_name                = "waf-visibility"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "waf_api_assoc" {   #Attaching WAF to API Gateway
  resource_arn = var.api_gateway_stage_arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}