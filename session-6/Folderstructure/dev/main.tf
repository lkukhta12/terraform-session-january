resource "aws_sqs_queue" "main" {
    name = "${var.env}-sqs"
    tags = {
        Enviroment = var.env
        Name = format("%s-sqs", var.env)
        Name1 ="${var.env}-sqs-new"
    } # dev-sqs, stage-sqs, qa-sqs, prod-sqs
}
