# Doctor Visit Diary

**One place for every consultation**

One place for every consultation.

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export via Actions) |

## Live site

https://password123-blip.github.io/doctor-visit-diary/

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `doctor_visit_diary_visits` table,
enables row-level security, and adds read/insert policies for anonymous users.

## Data model

Table: `doctor_visit_diary_visits`

| Column | Type |
| --- | --- |
| `doctor` | text |
| `speciality` | text |
| `reason` | text |
| `fee` | numeric |
| `visited_on` | date |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

Pushes to `main` trigger `.github/workflows/deploy-pages.yml`, which builds a
static export and publishes it to GitHub Pages. Set `NEXT_PUBLIC_SUPABASE_URL`
and `NEXT_PUBLIC_SUPABASE_ANON_KEY` as Actions repository secrets — the workflow
passes them into the build.

## What it does

- **Prescription-ready history** — Walk into any new doctor with the full picture.
- **Spend by speciality** — See where your medical money goes.
- **No accounts** — Your data stays in your own deployment.

## License

MIT
