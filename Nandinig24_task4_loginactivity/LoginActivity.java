// LoginActivity.java
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;

public class LoginActivity extends AppCompatActivity {

    private EditText editTextEmail;
    private EditText editTextPassword;
    private Button buttonLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // Initialize UI components
        editTextEmail = findViewById(R.id.editTextEmail);
        editTextPassword = findViewById(R.id.editTextPassword);
        buttonLogin = findViewById(R.id.buttonLogin);

        // Set click listener for the login button
       
buttonLogin.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View view) {
        // Get the entered email and password
        String email = editTextEmail.getText().toString().trim();
        String password = editTextPassword.getText().toString().trim();

        // Check if email and password are not empty
        if (!email.isEmpty() && !password.isEmpty()) {
            // Perform a simple validation for demonstration purposes
            if (isValidEmail(email) && isValidPassword(password)) {
                // Authentication successful, proceed to the next screen or perform necessary actions
                // Example: Start a new activity
                Intent intent = new Intent(LoginActivity.this, NextActivity.class);
                startActivity(intent);
                finish(); // Finish the current activity to prevent going back to the login screen
            } else {
                // Display an error message for invalid email or password
                Toast.makeText(LoginActivity.this, "Invalid email or password", Toast.LENGTH_SHORT).show();
            }
        } else {
            // Display an error message for empty email or password
            Toast.makeText(LoginActivity.this, "Please enter both email and password", Toast.LENGTH_SHORT).show();
        }
    }
});
    }
    private boolean isValidEmail(String email) {
    // You can implement a more comprehensive email validation if needed
    return Patterns.EMAIL_ADDRESS.matcher(email).matches();
}

private boolean isValidPassword(String password) {
    // You can implement password validation based on your requirements
    return password.length() >= 6; // For example, require a minimum of 6 characters
}
}