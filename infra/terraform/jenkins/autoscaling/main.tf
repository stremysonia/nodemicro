resource "aws_lb_target_group" "jenkins-tg" {
  port = 80
  protocol = "HTTP"
  name = "jenkins-target-group"
  vpc_id = var.vpc.id
  stickiness {
    type = "lb_cookie"
    enabled = true
  }
  health_check {
    enabled = true
    protocol = "HTTP"
    path = "/"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 10
    matcher = 200
  }
}

resource "aws_lb_target_group_attachment" "jenkins_master" {
  target_group_arn = aws_lb_target_group.jenkins-tg.arn
  target_id = var.jenkins_master.jenkins_master.id
  port = 8080
}

resource "aws_lb" "jenkins_alb" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg.elb_sg.id]
  subnets            = [for subnet in var.pub_subnet.datacentre-VPC_pubsubnets : subnet.id]
  enable_deletion_protection = false
  tags = {
      Name   = "jenkins_alb"
      Author = "Jespson"
  } 
}

# Create ALB Listner - HTTP
resource "aws_lb_listener" "jenkins_http" {
  load_balancer_arn = aws_lb.jenkins_alb.arn
  port = 8080
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.jenkins-tg.arn
  }
}

//resource "aws_alb" "jenkins_alb" {
//  cross_zone_load_balancing = true
//    security_groups           = [var.sg.elb_sg.id]
//   instances                 = [var.jenkins_master.jenkins_master.id]

//   listener {
//      instance_port      = 8080
//      instance_protocol  = "http"
//      lb_port            = 80
//      lb_protocol        = "http"
//    }

//    health_check {
//      healthy_threshold   = 2
//      unhealthy_threshold = 2
//      timeout             = 3
//      target              = "TCP:8080"
//      interval            = 5
//    }
//}
