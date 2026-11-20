using System;

public partial class DefaultPage : System.Web.UI.Page
{
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        int marks;

        if (!int.TryParse(txtMarks.Text, out marks))
        {
            lblResult.Text = "Rejected: please enter a whole number.";
            return;
        }

        // STARTER VERSION: this upper-bound condition is intentionally incorrect.
        // Lab 12 review task: ask Copilot to review the inclusive 0-to-10 requirement.
        // After reviewing and recording the baseline, change marks < 10 to marks <= 10.
        if (marks >= 0 && marks <=10)
        {
            lblResult.Text = "Accepted: " + marks;
        }
        else
        {
            lblResult.Text = "Rejected: enter whole-number marks from 0 to 10.";
        }
    }
}
