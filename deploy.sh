#!/bin/bash

# Task Scheduler - GitHub 배포 스크립트

echo "🚀 Task Scheduler GitHub 배포 스크립트"
echo "======================================"
echo ""

# GitHub 사용자명 입력
read -p "GitHub 사용자명을 입력하세요: " username

if [ -z "$username" ]; then
    echo "❌ 사용자명이 입력되지 않았습니다."
    exit 1
fi

# 저장소 이름 입력
read -p "저장소 이름 (기본값: task-scheduler): " repo_name
repo_name=${repo_name:-task-scheduler}

echo ""
echo "📦 설정 확인:"
echo "   사용자명: $username"
echo "   저장소명: $repo_name"
echo "   배포 URL: https://$username.github.io/$repo_name/"
echo ""

read -p "계속하시겠습니까? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "❌ 취소되었습니다."
    exit 0
fi

# Git 저장소 초기화 확인
if [ ! -d ".git" ]; then
    echo "📁 Git 저장소 초기화 중..."
    git init
    git branch -m main
    git config user.email "hansang@enuma.com"
    git config user.name "Hansang"
fi

# 파일 커밋
echo "📝 파일 추가 및 커밋 중..."
git add .
git commit -m "Deploy Task Scheduler Calendar App

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>" || echo "이미 커밋되어 있습니다."

# 원격 저장소 추가
echo "🔗 GitHub 원격 저장소 연결 중..."
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/$username/$repo_name.git"

# 푸시
echo "⬆️  GitHub에 푸시 중..."
echo ""
echo "⚠️  GitHub 로그인이 필요합니다."
echo "   Personal Access Token이 필요한 경우:"
echo "   https://github.com/settings/tokens 에서 생성하세요."
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 배포 완료!"
    echo ""
    echo "다음 단계:"
    echo "1. https://github.com/$username/$repo_name/settings/pages 접속"
    echo "2. Source: main branch, / (root) 선택"
    echo "3. Save 클릭"
    echo "4. 배포 URL: https://$username.github.io/$repo_name/"
else
    echo ""
    echo "❌ 푸시 실패. 다음을 확인하세요:"
    echo "   1. GitHub에 '$repo_name' 저장소를 미리 만들었는지 확인"
    echo "   2. GitHub 로그인 정보가 올바른지 확인"
    echo "   3. Personal Access Token 권한 확인"
fi
