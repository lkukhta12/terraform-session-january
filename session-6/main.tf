resource "aws_sqs_queue" "main" {
    name = "${var.env}-sqs"
    tags = {
        Enviroment = var.env
        Name = format("%s-sqs", var.env)
    } # dev-sqs, stage-sqs, qa-sqs, prod-sqs
}
