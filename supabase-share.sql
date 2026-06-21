create table if not exists public.mandalarts (
  id text primary key,
  data jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.mandalarts enable row level security;

drop policy if exists "Public mandalart read" on public.mandalarts;
create policy "Public mandalart read"
on public.mandalarts
for select
using (true);

drop policy if exists "Public mandalart create" on public.mandalarts;
create policy "Public mandalart create"
on public.mandalarts
for insert
with check (true);
