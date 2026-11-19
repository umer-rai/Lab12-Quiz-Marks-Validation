# Lab 12 — AI-Assisted Code Review and Quality Assurance

## Important compatibility note
This is a classic ASP.NET Web Forms project (C# / .NET Framework 4.8), matching the technology shown in the Lab 11 workbook. VS Code can edit these files, but it does not itself provide the classic Web Forms runtime. Run the site on Windows using IIS or IIS Express with the .NET Framework 4.8 runtime/developer pack installed.

## Project files
- `Default.aspx`: Web Forms user interface.
- `Default.aspx.cs`: C# server-side validation event.
- `Web.config`: classic ASP.NET configuration.
- `tests/test_validation.py`: Selenium browser tests.
- `requirements.txt`: Python Selenium dependency.

## Requirement from Exercise AI 2026
Accept integer marks from 0 through 10 inclusive. Reject integers outside this range.
Required test inputs: -1, 0, 5, 10, 11.

## Starter version and review exercise
The starter code intentionally uses `marks < 10`, so the upper boundary value 10 is rejected. This gives the team a concrete boundary defect to investigate during the Lab 12 review. Do not claim Copilot found it unless Copilot actually reports it. Capture its real review result.

After recording the baseline and reviewing the code, change this condition in `Default.aspx.cs`:
`if (marks >= 0 && marks < 10)`
to:
`if (marks >= 0 && marks <= 10)`

This is the minimal fix for the inclusive upper boundary. Save, commit, and rerun all five Selenium tests. The final expected results are:
-1 Reject; 0 Accept; 5 Accept; 10 Accept; 11 Reject.

## Install Selenium
Open a terminal in this project folder:
```powershell
py -m venv .venv
.venv\\Scripts\\Activate.ps1
py -m pip install -r requirements.txt
```
If PowerShell blocks activation, use Command Prompt:
```bat
.venv\\Scripts\\activate.bat
```

## Run the Web Forms site
You need Windows with IIS Express installed and the .NET Framework 4.8 runtime. Open a terminal and run (adjust the folder path):
```bat
iisexpress.exe /path:"C:\\path\\to\\Lab12_Quiz_Validation_ASPNET_WebForms" /port:8080
```
Keep this terminal open. Visit:
`http://localhost:8080/Default.aspx`

If `iisexpress.exe` is not recognized, IIS Express is not installed or is not on PATH. Install IIS Express, or use a configured local IIS website. VS Code alone cannot run classic ASP.NET Web Forms.

## Run Selenium
Open a second terminal in the project folder, activate `.venv`, then run:
```powershell
py -m unittest discover -s tests -v
```
Chrome must be installed. Recent Selenium versions use Selenium Manager to locate/manage the browser driver. If your browser setup prompts for permission or a driver download, complete that setup before recording.

## Lab 12 Git workflow
Start from your existing GitHub repository's default branch and ensure it is up to date. Follow the workbook's branch name:
```bash
git switch -c lab12-ai-review
```
Add and commit the starter code change, then push:
```bash
git add Default.aspx Default.aspx.cs Web.config README.md requirements.txt tests/test_validation.py
git commit -m "Prepare Lab 12 quiz validation review"
git push -u origin lab12-ai-review
```
Open a Pull Request with the default branch as base and `lab12-ai-review` as compare. State the requirement: accept integer marks 0–10 inclusive and reject values outside the range. Request Copilot review if Copilot appears in the Reviewers list and your account/repository has access. If unavailable, follow the workbook instruction to ask the instructor or use the instructor-enabled repository.

## Evidence to capture
1. Application open in the browser.
2. Manual boundary test for 10 (starter version rejects it).
3. GitHub Pull Request and Copilot review outcome.
4. Baseline Selenium output (the 10 test should fail; other four should pass).
5. Updated condition in `Default.aspx.cs`.
6. Follow-up commit.
7. Final Selenium output (all five should pass).

Do not fabricate Copilot feedback or test results. Record what actually happens on your machine.
