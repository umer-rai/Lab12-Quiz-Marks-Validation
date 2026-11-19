<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DefaultPage" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Quiz Marks Validation</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0; min-height: 100vh; display: grid; place-items: center;
            background: #f2f5f9; font-family: Arial, sans-serif; color: #182230;
        }
        .panel {
            width: min(92vw, 440px); padding: 30px; background: white;
            border-radius: 14px; box-shadow: 0 8px 28px rgba(20, 35, 55, .10);
        }
        h1 { margin: 0 0 8px; font-size: 25px; }
        .hint { color: #596579; margin: 0 0 22px; line-height: 1.5; }
        label { display: block; margin-bottom: 8px; font-weight: 700; }
        .marks {
            width: 100%; padding: 12px; border: 1px solid #b8c2d1;
            border-radius: 8px; font-size: 16px;
        }
        .submit {
            width: 100%; margin-top: 14px; padding: 12px; border: 0;
            border-radius: 8px; background: #175cd3; color: white;
            font-size: 16px; font-weight: 700; cursor: pointer;
        }
        .submit:hover { background: #1849a9; }
        .result { display: block; margin-top: 18px; min-height: 24px; font-weight: 700; }
        .note { margin-top: 18px; color: #667085; font-size: 13px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <main class="panel">
            <h1>Quiz Marks Validation</h1>
            <p class="hint">Enter a whole-number mark between 0 and 10, inclusive.</p>

            <label for="txtMarks">Quiz marks</label>
            <asp:TextBox ID="txtMarks" runat="server" ClientIDMode="Static"
                CssClass="marks" TextMode="Number" />
            <asp:Button ID="btnValidate" runat="server" ClientIDMode="Static"
                Text="Validate Marks" CssClass="submit" OnClick="btnValidate_Click" />
            <asp:Label ID="lblResult" runat="server" ClientIDMode="Static"
                CssClass="result" />
            <p class="note">Valid range: 0–10 inclusive.</p>
        </main>
    </form>
</body>
</html>
