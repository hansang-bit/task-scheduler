# Task Scheduler Calendar App - Project Rules

## Technical Constraints (Strict)
1. **No Heavy Libraries**: Pixi.js, Three.js 등 무거운 WebGL 라이브러리 사용 금지. 오직 순수 HTML5 Canvas API와 Vanilla JavaScript만 사용.
2. **Single File**: HTML, CSS, JS가 하나로 합쳐진 단일 `index.html` 파일. Supabase JS SDK만 CDN으로 외부 로드 허용.
3. **GitHub Pages Hosting**: 정적 파일만 서빙. 서버 사이드 로직 없음.

## Data Storage
- **Supabase (PostgreSQL)** 를 백엔드 DB로 사용하여 모든 사용자 간 데이터 공유
- 테이블 3개: `workers`, `projects`, `tasks`
- 로그인 상태는 `localStorage`에 저장 (현재 선택된 작업자 ID)
- Supabase 미설정 시 localStorage fallback으로 오프라인 동작

## Supabase Setup Guide
1. [Supabase](https://supabase.com) 회원가입 (GitHub 로그인 가능)
2. "New Project" → 이름/비밀번호 입력 → Region: **Northeast Asia (Seoul)** 선택 → 생성
3. 좌측 메뉴 "SQL Editor" 에서 아래 SQL 실행:

```sql
-- 작업자 테이블
CREATE TABLE workers (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  active BOOLEAN DEFAULT true
);

-- 프로젝트 테이블
CREATE TABLE projects (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  active BOOLEAN DEFAULT true
);

-- 작업(일감) 테이블
CREATE TABLE tasks (
  id TEXT PRIMARY KEY,
  worker_id TEXT REFERENCES workers(id),
  project_id TEXT REFERENCES projects(id),
  description TEXT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  working_days INTEGER DEFAULT 0
);

-- Row Level Security 비활성화 (팀 내부 도구)
ALTER TABLE workers ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all on workers" ON workers FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on projects" ON projects FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on tasks" ON tasks FOR ALL USING (true) WITH CHECK (true);
```

4. 좌측 메뉴 "Project Settings" → "API" 탭에서 복사:
   - **Project URL** → `index.html`의 `SUPABASE_URL`에 붙여넣기
   - **anon public key** → `index.html`의 `SUPABASE_KEY`에 붙여넣기

5. 초기 데이터는 앱 최초 실행 시 자동 삽입됨 (코드에서 처리)

## Korean Holidays
- 2025-2026년 공휴일 하드코딩 (음력 기반 공휴일은 알고리즘으로 계산 불가)
- 매년 초 새해 공휴일 데이터 수동 업데이트 필요
- 대체공휴일 포함

## Design
- Claude Desktop 스타일: 미니멀, 클린, 뉴트럴 톤
- `system-ui` 폰트 패밀리 사용
