// pipeline {

//     parameters {
//         booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
//     } 
//     environment {
//         AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
//         AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
//     }

//    agent  any
//     stages {
//         stage('checkout') {
//             steps {
//                  script{
//                         dir("terraform")
//                         {
//                             git "https://github.com/EugineEbe/First_Project.git"
//                         }
//                     }
//                 }
            
//             }      

//         stage('Plan') {
//             steps {
//                 sh 'pwd;cd terraform/ ; terraform init'
//                 sh "pwd;cd terraform/ ; terraform plan -out tfplan"
//                 sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
//             }
//         }
//         stage('Approval') {
//            when {
//                not {
//                    equals expected: true, actual: params.autoApprove
//                }
//            }

//            steps {
//                script {
//                     def plan = readFile 'terraform/tfplan.txt'
//                     input message: "Do you want to apply the plan?",
//                     parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
//                }
//            }
//        }

//         stage('Apply') {
//             steps {
//                 sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
//             }
//         }
//     }

//   }




pipeline {
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any

    stages {
        stage('Terraform Init') {
            steps {
                dir('Terraform') {
                    echo "connected ............"
                    // git "https://github.com/EugineEbe/First_Project.git"
                    sh 'pwd'; 
                    
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('Terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('Terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
