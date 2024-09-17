# 3days - Infra as Code

## Terraform Cloud 배포를 위한 변수 설정

### 환경 변수
Terraform Cloud에서 환경 변수로 설정해야 합니다:

1. `AWS_ACCESS_KEY_ID`: AWS 액세스 키 ID
2. `AWS_SECRET_ACCESS_KEY`: AWS 시크릿 액세스 키
3. `AWS_DEFAULT_REGION`: 배포할 AWS 리전 (예: "ap-northeast-2")

### Terraform 변수
Terraform Cloud에서 Terraform 변수로 설정해야 합니다:

1. `db_username`: RDS 인스턴스의 사용자 이름
    - 민감 정보로 표시
2. `db_password`: RDS 인스턴스의 비밀번호
    - 민감 정보로 표시
3. `environment`: 배포 환경 (예: "dev" 또는 "prod")
4. `app_name`: 애플리케이션 이름 (예: "3days-dev")
5. `solution_stack_name`: Elastic Beanstalk 솔루션 스택 이름 (예: "64bit Amazon Linux 2023 v4.0.1 running Docker")
6. `instance_type`: Elastic Beanstalk용 EC2 인스턴스 타입 (예: "t2.micro")
7. `min_size`: Auto Scaling의 최소 인스턴스 수 (예: 1)
8. `max_size`: Auto Scaling의 최대 인스턴스 수 (예: 2)
9. `repository_name`: ECR 리포지토리 이름 (예: "3days-app")

### 주의사항
- 데이터베이스 자격 증명과 같은 민감한 정보는 Terraform Cloud에서 반드시 민감 정보로 표시해야 합니다.
- 특정 모듈 구성과 요구사항에 따라 이 변수들을 조정해야 할 수 있습니다.
- 여러 워크스페이스에서 공유되는 변수가 있다면 Terraform Cloud의 변수 세트 기능 사용을 고려하세요.
