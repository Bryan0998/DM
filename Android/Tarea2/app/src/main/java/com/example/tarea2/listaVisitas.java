package com.example.tarea2;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;

public class listaVisitas extends AppCompatActivity {

    private ListView listView;
    private ArrayList<String> visitas;
    private TextView txtTitulo;
    private String idLugar="0";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lista_visitas);

        visitas = new ArrayList<String>();
        listView = findViewById(R.id.listViewVisitas);
        idLugar = getIntent().getStringExtra("idLugar");
        txtTitulo = findViewById(R.id.txtTitulo);
        txtTitulo.setText("Visitas a "+getNombreLugar());
        llenarVisitas();
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.list_item, visitas);
        listView.setAdapter(adapter);
    }

    public void llenarVisitas(){
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();
        Cursor fila = db.rawQuery("select reseña,fecha from Visita where idLugar="+idLugar+" order by fecha desc",null);
        visitas = new ArrayList<String>();

        if (fila.moveToFirst()){
            do{
                String reseña = fila.getString(0);
                String fecha = fila.getString(1);
                String[] componentes = fecha.split("/");
                visitas.add(componentes[2]+"/"+componentes[1]+"/"+componentes[0]+": "+reseña);
            }while (fila.moveToNext());
        }
        db.close();
    }
    public String getNombreLugar(){
        String nombre="";
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();
        Cursor fila = db.rawQuery("select nombre from Lugar where id="+idLugar,null);

        if (fila.moveToFirst()){
            nombre = fila.getString(0);
        }
        db.close();

        return nombre;
    }
    public void altaVisita(View view){
        Intent intent = new Intent(this, AltaVisitas.class);
        intent.putExtra("idLugar", idLugar);
        startActivity(intent);
    }
    public void regresar(View view){
        Intent intent = new Intent(this, AltaLugarActivity.class);
        intent.putExtra("idLugar", idLugar);
        startActivity(intent);
    }
}
