# Task Scheduler Calendar App

팀 내부용 작업 스케줄 관리 캘린더 애플리케이션입니다.

## 🚀 Features

- 📅 직관적인 캘린더 뷰로 작업자별 일정 관리
- 👥 다중 작업자 지원
- 📊 프로젝트별 작업 분류
- 🇰🇷 한국 공휴일 자동 표시 (2025-2026)
- 💾 Supabase 백엔드 또는 로컬 스토리지 지원
- 📱 반응형 디자인

## 🌐 Demo

배포 후 GitHub Pages URL이 여기에 표시됩니다.

## 🛠️ Tech Stack

- Pure HTML5 / CSS3 / Vanilla JavaScript
- Supabase (PostgreSQL) for backend
- GitHub Pages for hosting

## 📋 Setup

### 1. Supabase 설정 (선택사항)

Supabase를 사용하면 여러 사용자 간 데이터를 실시간으로 공유할 수 있습니다.

1. [Supabase](https://supabase.com) 회원가입
2. New Project 생성 (Region: Northeast Asia - Seoul)
3. SQL Editor에서 `CLAUDE.md`의 SQL 스크립트 실행
4. Project Settings → API에서 URL과 anon key 복사
5. `index.html`의 `SUPABASE_URL`과 `SUPABASE_KEY` 값 업데이트

### 2. 로컬 실행

```bash
# 간단히 index.html 파일을 브라우저로 열거나
# 로컬 서버 실행
python -m http.server 8000
```

## 📖 Usage

1. **작업자 선택**: 상단에서 현재 작업자 선택
2. **일정 추가**: 캘린더에서 날짜 범위를 선택하고 작업 정보 입력
3. **일정 편집**: 기존 일정 클릭하여 수정 또는 삭제
4. **필터링**: 프로젝트별로 일정 필터링 가능

## 📝 License

MIT License - 내부 팀 용도로 자유롭게 사용 가능합니다.

## 🤝 Contributing

팀 내부 프로젝트이므로 누구나 자유롭게 개선할 수 있습니다.
