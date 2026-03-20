# GitHub Pages 배포 가이드

## 📦 준비된 파일

아래 경로에 Git 저장소가 준비되어 있습니다:
```
/sessions/confident-ecstatic-heisenberg/task-scheduler/
```

파일 목록:
- `index.html` - 메인 애플리케이션
- `CLAUDE.md` - 프로젝트 규칙 및 Supabase 설정 가이드
- `README.md` - 프로젝트 문서
- `.gitignore` - Git 제외 파일 목록

## 🚀 GitHub에 올리는 방법

### 방법 1: GitHub 웹사이트 사용 (가장 간단)

1. [GitHub](https://github.com)에 로그인
2. 우측 상단 `+` → `New repository` 클릭
3. Repository 정보 입력:
   - **Repository name**: `task-scheduler` (또는 원하는 이름)
   - **Public** 선택 (GitHub Pages 무료 사용)
   - ✅ **Add a README file** 체크 해제 (이미 있음)
4. `Create repository` 클릭
5. 생성된 페이지에서 "…or push an existing repository from the command line" 섹션의 명령어 확인

### 방법 2: Git 명령어로 푸시

터미널에서 아래 명령어 실행:

```bash
cd /sessions/confident-ecstatic-heisenberg/task-scheduler

# GitHub 저장소 추가 (본인의 GitHub username으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/task-scheduler.git

# 코드 푸시
git push -u origin main
```

**주의**: `YOUR_USERNAME`을 본인의 GitHub 사용자명으로 바꿔주세요.

## 🌐 GitHub Pages 활성화

1. GitHub 저장소 페이지에서 **Settings** 탭 클릭
2. 좌측 메뉴에서 **Pages** 클릭
3. **Source** 섹션에서:
   - Branch: `main` 선택
   - Folder: `/ (root)` 선택
4. **Save** 클릭
5. 잠시 후 상단에 배포 URL이 표시됩니다:
   ```
   https://YOUR_USERNAME.github.io/task-scheduler/
   ```

## ⚙️ Supabase 설정 (선택사항)

로컬에서만 사용한다면 localStorage로 충분하지만, 팀원들과 데이터를 공유하려면:

1. `CLAUDE.md` 파일의 **Supabase Setup Guide** 참고
2. Supabase 프로젝트 생성 후 URL과 Key 획득
3. `index.html` 파일의 9-10번째 줄 수정:
   ```javascript
   const SUPABASE_URL = 'your-project-url-here';
   const SUPABASE_KEY = 'your-anon-key-here';
   ```
4. 변경사항 커밋 & 푸시:
   ```bash
   git add index.html
   git commit -m "Configure Supabase credentials"
   git push
   ```

## ✅ 완료!

배포 후 `https://YOUR_USERNAME.github.io/task-scheduler/` 접속하여 확인하세요.

---

**문제가 있다면?**
- GitHub Actions 탭에서 배포 상태 확인
- 배포는 보통 1-2분 정도 소요됩니다
