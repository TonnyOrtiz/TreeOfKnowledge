# Bitacora
Se utilizará esta página para documentar el proceso de aprendizaje de Flutter.

## **23/08/2022** - Instalacion de Flutter

Se instala Flutter en Kubuntu 22.04 junto con todas sus dependencias.
Para ello se utilizan los siguientes comandos:


```
sudo snap install flutter --classic
sudo snap install android-studio --clasic
```

Adicionalmente se tiene que entrar en Android studio, en el sdk manager y se debe instalar el Tool llamado: Android SDK Command-line Tools
Por último para corregir un error que tiraba el flutter doctor con respecto a unas licencias utilicé el siguiente comando:

```
flutter doctor --android-licenses
```


