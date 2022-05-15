/*Descargar librerias*/
import java.util.Scanner;

// Objeto main
public class Main {
    public static void main(String[] args) {
        //Asignamos nuestra función "Scanner" a una variable
        Scanner lectura = new Scanner(System.in);

        //Presentacion y programa en general
        System.out.println("¡Bienvenido a la tienda de libros!");
        System.out.println("Por favor cargue los siguientes datos:\n");

        System.out.println("Nombre del libro:");
        //Usamos nuestra variable lectura y hacemos el llamado a función del scanner.
        String nombreLibro = lectura.next();

        System.out.println("Ingrese el ID del libro (Solo se permiten números):");
        // Mismo sitema que el anterior pero recordemos que next() toma como defecto str, debemos solicitar tipo int (Entero).
        int idLibro = lectura.nextInt();

        System.out.println("Ingrese el precio del libro (separado por (.) puntos, no coma (,):");
        //Mismo procedimiento, pero dado que es un precio puede tener decimales y para ello usamos float.
        float precioLibro = lectura.nextFloat();

        System.out.println("Ingrese si el libro sera con envió gratis donde: True = Si, False = No: ");
        //Mismo procedimiento pero trabajamos con boleanos.
        boolean envioGratis = lectura.hasNextBoolean();

        //Impresión de datos
        System.out.println("Los datos son los siguientes:\n");
        System.out.println("Nombre del libro: " + nombreLibro);
        System.out.println("ID del libro: " + idLibro);
        System.out.println("Precio del libro: " + precioLibro);
        System.out.println("¿Envio Gratis?: " + envioGratis);
    }
}