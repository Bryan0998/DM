package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import java.util.Random;
import android.widget.Button;
import android.content.Intent;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    private Button button1;
    private Button button2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        button1 = findViewById(R.id.button);
        button2 = findViewById(R.id.button2);
        random();
    }
    private void random(){
        Random r = new Random();
        Integer n = r.nextInt(100);
        Integer n2 = r.nextInt(100);
        button1.setText(n.toString());
        button2.setText(n2.toString());
    }
    public void enviar(View view){
        Button button = (Button)view;
        Intent intent = new Intent(this,Main2Activity.class);
        intent.putExtra("numero",button.getText());
        startActivity(intent);
    }
}
