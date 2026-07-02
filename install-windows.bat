@echo off
REM ============================================================================
REM  Live Web Studios - Windows install for claude-global-config
REM  COPIES the repo into %USERPROFILE%\.claude (no symlinks, per LWS Windows policy).
REM  Copies Jon's OWN skills individually so CLI-installed borrowed skills
REM  (impeccable, ui-ux-pro-max) already in .claude\skills\ are preserved.
REM
REM  Run once per Windows machine after cloning the repo. Safe to re-run.
REM  NOTE: this is the repo -> .claude SETUP direction. Ongoing .claude -> repo
REM  commits are handled by your existing synccmd.bat.
REM ============================================================================

setlocal

REM ---- Confirm this path matches where your Windows clone actually lives ----
set "REPO=%USERPROFILE%\Sites\claude-global-config"
set "CLAUDE=%USERPROFILE%\.claude"

if not exist "%REPO%\CLAUDE.md" (
  echo Repo not found at %REPO%
  echo Clone it first:  git clone git@github.com:livewebstudios/claude-global-config.git "%REPO%"
  exit /b 1
)

if not exist "%CLAUDE%\skills" mkdir "%CLAUDE%\skills"

REM ---- Core file + spec/command folders ----
copy /Y "%REPO%\CLAUDE.md" "%CLAUDE%\CLAUDE.md" >nul
xcopy /E /I /Y "%REPO%\specs"    "%CLAUDE%\specs"    >nul
xcopy /E /I /Y "%REPO%\commands" "%CLAUDE%\commands" >nul
echo copied: CLAUDE.md, specs\, commands\

REM ---- Jon's OWN skills, copied one at a time (borrowed skills untouched) ----
for %%S in (jonvoice lws-proposal powered-by prompt-master 47 generate-clients-md process-interviewer ask-the-board) do (
  if exist "%REPO%\skills\%%S" (
    xcopy /E /I /Y "%REPO%\skills\%%S" "%CLAUDE%\skills\%%S" >nul
    echo copied skill: %%S
  ) else (
    echo WARNING: %REPO%\skills\%%S missing, skipped
  )
)

echo.
echo Windows install complete.
echo   Source: %REPO%
echo   Copied into: %CLAUDE%
echo.
echo Next: install borrowed skills per REQUIRED-SKILLS.md  -^>  npx skills add pbakaus/impeccable
endlocal
