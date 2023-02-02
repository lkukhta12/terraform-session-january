resource "aws_instance" "first_ec2" {
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
}

// Blocks: 
// A block is a container for other content: 

// A block has a type: resource in this example 
// Each block type defines how many labels must follow the type keyword 
// The resource block type expects two labels, which are aws_instance and first_ec2 in the example above.

// Terraform has 2 main Blocks : 
// 1.Resource Block: Create and Manage resources 
// 2. Data Source Block: Fetch the data from existing resources.

// Resouces block expects 2 labels:  
// 1.First Label: 
//   --This is predefined by Terraform 
//   --This label indicates the resource 
//   Example: “aws_instance” 
// 2.Second Label 
// --This is defined by Author 
// -- This label indicates the logical name of the resource. Logical name or id must be unique 
// Data Source Block - Fetch the data from existing resources. 

// Arguments: 
// An argument assigns a value to a particular name 
// The identifier before the equal sign is the argument name, and the expression after the equal sign is the argument’s value.

// Argument consist of Name and Value 
// Argument Name: 
// --This is predefined by Terraform 
// --Configuration of your resource 
// --Example: ami 

// Argument Value: 
// --This is predefined by Author 
// --Value fo the configurations
// --Example: "ami-0aa7d40eeae50c9a9"
//    Working directory: 
//       - Where you have all Terraform configuration file  
//       - example: session-2