-- Run this in the Supabase Dashboard: SQL Editor.
create table if not exists public.contact_submissions (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  email text not null,
  project_message text not null,
  created_at timestamptz not null default now()
);

alter table public.contact_submissions enable row level security;

grant insert on table public.contact_submissions to anon;

-- The website can create briefs, but browser visitors cannot read them.
create policy "Allow public brief submissions"
  on public.contact_submissions
  for insert
  to anon
  with check (true);
