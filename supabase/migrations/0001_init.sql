-- Doctor Visit Diary — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.doctor_visit_diary_visits (
  id uuid primary key default gen_random_uuid(),
  doctor text,
  speciality text,
  reason text,
  fee numeric,
  visited_on date,
  created_at timestamptz not null default now()
);

create index if not exists doctor_visit_diary_visits_created_idx on public.doctor_visit_diary_visits (created_at desc);

alter table public.doctor_visit_diary_visits enable row level security;

drop policy if exists "doctor_visit_diary_visits_read" on public.doctor_visit_diary_visits;
create policy "doctor_visit_diary_visits_read" on public.doctor_visit_diary_visits for select using (true);

drop policy if exists "doctor_visit_diary_visits_insert" on public.doctor_visit_diary_visits;
create policy "doctor_visit_diary_visits_insert" on public.doctor_visit_diary_visits for insert with check (true);
