{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": [
"secretsmanager:GetSecretValue",
"secretsmanager:ListSecrets"
],
"Resource": "*"
},
{
"Effect": "Allow",
"Action": [
"kms:Decrypt"
],
"Resource": "*"
}
]
}
