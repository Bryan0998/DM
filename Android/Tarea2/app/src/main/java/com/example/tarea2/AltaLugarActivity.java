package com.example.tarea2;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class AltaLugarActivity extends AppCompatActivity {

    private EditText txtNombre;
    private EditText txtUbicacion;
    private EditText txtDescripcion;
    private EditText txtFecha;
    private Button buttonVisita;
    private String id="0";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_alta_lugar);

        txtNombre = findViewById(R.id.txtNombre);
        txtUbicacion = findViewById(R.id.txtUbicacion);
        txtDescripcion = findViewById(R.id.txtDescripcion);
        txtFecha = findViewById(R.id.txtFecha);

        if(getIntent().hasExtra("idLugar")){
            id=getIntent().getStringExtra("idLugar");
            llenarCampos();
        }
    }
    public void guardar(View view){
        AdminSQLiteOpenHelper admin = new AdminSQLiteOpenHelper(this,"lugares",null, 1);
        SQLiteDatabase db = admin.getWritableDatabase();

        String nombre = txtNombre.getText().toString();
        String ubicacion = txtUbicacion.getText().toString();
        String descripcion = txtDescripcion.getText().toString();
        String fecha = txtFecha.getText().toString();
        String[] componentes = fecha.split("/");
        String fecha2 = componentes[2]+"/"+componentes[1]+"/"+componentes[0];


        if (!nombre.isEmpty() && !ubicacion.isEmpty() && !descripcion.isEmpty() && !fecha.isEmpty()){
            ContentValues registro = new ContentValues();
            registro.put("nombre", nombre);
            registro.put("ubicacion",ubicacion);
            registro.put("descripcion", descripcion);
            registro.put("ultimaFecha", fecha2);

            if (id=="0"){
                db.insert("Lugar",null,registro);
                Toast.makeText(this,"Registro exitoso",Toast.LENGTH_SHORT).show();
                db.close();
                insertarVisita(fecha2,nombre);
            }
            else{
                db.update("Lugar",registro,"id="+id,null);
                Toast.makeText(this,"Modificación exitosa",Toast.LENGTH_SHORT).show();
            }

            txtNombre.setText("");
            txtUbicacion.setText("");
            txtDescripcion.setText("");
            txtFecha.setText("");
        }
        else{
            Toast.makeText(this,"Debes llenar todos los campos",Toast.LENGTH_SHORT).show();
        }
        db.close();
    }

    private void insertarVisita(String fecha,String nombre) {
        AdminSQLiteOpenHelper admin = new AdminSQLiteOpenHelper(this,"lugares",null, 1);
        SQLiteDatabase db = admin.getWritableDatabase();

        String reseña = "Primer visita";
        String id = consultaID(nombre);

        ContentValues registro = new ContentValues();
        registro.put("idLugar",id);
        registro.put("reseña",reseña);
        registro.put("fecha",fecha);

        db.insert("Visita",null,registro);
        db.close();
    }

    public void regresar(View view){
        Intent intent = new Intent(this,MainActivity.class);
        startActivity(intent);
    }
    public void llenarCampos(){
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();

        Cursor fila = db.rawQuery("select nombre,ubicacion,descripcion,ultimaFecha from Lugar where id="+id,null);
        if (fila.moveToFirst()){
            txtNombre.setText(fila.getString(0));
            txtUbicacion.setText(fila.getString(1));
            txtDescripcion.setText(fila.getString(2));
            String fecha = fila.getString(3);
            String[] componentes = fecha.split("/");
            String fecha2=componentes[2]+"/"+componentes[1]+"/"+componentes[0];
            txtFecha.setText(fecha2);
        }
        db.close();
    }
    public void clickVisitas(View view){
        if (id!="0") {
            Intent intent = new Intent(this, listaVisitas.class);
            intent.putExtra("idLugar", id);
            startActivity(intent);
        }
        else{
            Toast.makeText(this,"El lugar no está registrado",Toast.LENGTH_SHORT).show();
        }
    }
    public String consultaID(String nombre){
        String id="";
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();

        Cursor fila = db.rawQuery("select id from Lugar where nombre='"+nombre+"'",null);
        if (fila.moveToFirst()){
            id = fila.getString(0);
        }
        db.close();
        return id;
    }

}
