create table if not exists public.mandalarts (
  id text primary key,
  data jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.mandalarts enable row level security;

grant usage on schema public to anon;
grant select, insert on public.mandalarts to anon;
grant select, insert on public.mandalarts to authenticated;

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
