include .env
export

## Project
project-install:
	brew install supabase/tap/supabase
	npm install pnpm -g
	pnpm i
	make supabase-start


## Supabase
supabase-start:
	supabase start
	open "http://127.0.0.1:54323"

supabase-stop:
	supabase stop

supabase-studio:
	open "http://127.0.0.1:54323"

generate-types:
ifeq ($(strip $(SUPABASE_ENV)),LOCAL)
	pnpx supabase gen types typescript --local > types/supabase.ts
else
	pnpx supabase gen types typescript --project-id $(PROJECT_ID) --schema public > types/supabase.ts
endif