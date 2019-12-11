package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.view.View;

public class Main2Activity extends AppCompatActivity {

    private String numeroAnterior;
    private Button btnRojo;
    private Button btnAzul;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        btnRojo = findViewById(R.id.colorRojo);
        btnAzul = findViewById(R.id.colorAzul);
        numeroAnterior = getIntent().getStringExtra("numero");
    }
    public void enviar(View view){
        Button button = (Button)view;
        Intent intent = new Intent(this,Main3Activity.class);
        intent.putExtra("numero",numeroAnterior);
        String color = (button.getId()==R.id.colorAzul) ? "Azul" : "Rojo";
        intent.putExtra("color",color);
        startActivity(intent);
    }

}
