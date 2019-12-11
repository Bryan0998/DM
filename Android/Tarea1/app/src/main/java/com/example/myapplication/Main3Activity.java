package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Main3Activity extends AppCompatActivity {

    private String numero;
    private String color;
    private TextView textColor;
    private TextView textNumero;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main3);
        numero = getIntent().getStringExtra("numero");
        color = getIntent().getStringExtra("color");
        textColor = findViewById(R.id.textColor);
        textNumero = findViewById(R.id.textNumero);

        textNumero.setText(numero);
        textColor.setText(color);

    }
    public void reiniciar(View view){
        Intent intent = new Intent(this,MainActivity.class);
        startActivity(intent);

    }
}
