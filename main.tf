resource "aws_instance" "web" {
  ami                    = "ami-0277155c3f0ab2930"
  instance_type          = "t2.micro"
  key_name               = "devops"
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd 
              sudo systemctl start httpd
              sudo systemctl enable httpd
              
              # Create HTML file with embedded CSS
              cat <<'EOT' | sudo tee /var/www/html/index.html
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Simple Olowo Web Page</title>
                  <style>
                      body {
                          font-family: Arial, sans-serif;
                          background-color: #71097e;
                          margin: 0;
                          padding: 0;
                          display: flex;
                          justify-content: center;
                          align-items: center;
                          height: 100vh;
                      }
                      .container {
                          text-align: center;
                          background-color: #fff;
                          padding: 20px;
                          border-radius: 8px;
                          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                      }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <h1>Welcome to My Simple Olowo Web Page</h1>
                      <p>This is a basic HTML and CSS site deployed on AWS EC2 using Terraform.</p>
                  </div>
              </body>
              </html>
              EOT
              EOF

  tags = {
    Name = "web-server"
  }
}

