/**
 * Archivo: Code.gs
 * Proyecto: Automatizaci\u00f3n de Reporte de Ventas Diarias por Email
 * Descripci\u00f3n: Este script de Google Apps Script automatiza la generaci\u00f3n
 * y env\u00edo diario de un reporte de ventas extrayendo datos de Google Sheets
 * y envi\u00e1ndolo por email v\u00eda Gmail Service.
 *
 * Rol: Programador Senior Fullstack
 * Misi\u00f3n: Escribir el c\u00f3digo real basado en el dise\u00f1o del Architect.
 * Salida: C\u00f3digo puro, listo para guardar en archivo.
 */

// =========================================================================
// Configuraci\u00f3n Global: Ajusta estos valores seg\u00fan tu entorno.
// =========================================================================

/**
 * ID de la hoja de c\u00e1lculo de Google Sheets donde se encuentran los datos de ventas.
 * Puedes encontrarlo en la URL de tu hoja de c\u00e1lculo:
 * https://docs.google.com/spreadsheets/d/TU_ID_DE_HOJA_DE_CALCULO/edit
 * @type {string}
 */
const SPREADSHEET_ID = 'TU_ID_DE_HOJA_DE_CALCULO_AQUI';

/**
 * Nombre de la hoja espec\u00edfica dentro del Google Sheet que contiene los datos de ventas.
 * Ej: 'Ventas Diarias', 'Datos Tienda A'.
 * @type {string}
 */
const SHEET_NAME = 'Ventas';

/**
 * Direcci\u00f3n(es) de correo electr\u00f3nico a la(s) que se enviar\u00e1 el reporte.
 * M\u00faltiples direcciones pueden separarse por comas (ej: 'email1@ejemplo.com,email2@ejemplo.com').
 * @type {string}
 */
const RECIPIENT_EMAIL = 'tu.email@ejemplo.com';

/**
 * Prefijo para el asunto del correo electr\u00f3nico del reporte.
 * La fecha del reporte ser\u00e1 a\u00f1adida autom\u00e1ticamente.
 * @type {string}
 */
const REPORT_SUBJECT_PREFIX = 'Reporte de Ventas Diarias - ';

// =========================================================================
// Funciones Principales de Automatizaci\u00f3n
// =========================================================================

/**
 * Funci\u00f3n principal que orquesta la generaci\u00f3n y el env\u00edo del reporte de ventas diario.
 * Esta funci\u00f3n debe ser configurada como un disparador basado en tiempo (Time-driven trigger)
 * para ejecutarse diariamente.
 */
function sendDailySalesReport() {
  Logger.log('----------------------------------------------------');
  Logger.log('Iniciando generaci\u00f3n y env\u00edo de reporte de ventas diario.');

  try {
    // 1. Obtener la fecha del d\u00eda anterior para el reporte.
    const yesterday = getYesterdayDate();
    const formattedReportDate = Utilities.formatDate(yesterday, Session.getScriptTimeZone(), 'yyyy-MM-dd');
    Logger.log('Fecha objetivo del reporte: ' + formattedReportDate);

    // 2. Extraer datos de ventas del Google Sheet para la fecha objetivo.
    // Se asume que la primera columna de la hoja contiene la fecha de la venta.
    const salesData = getSalesData(yesterday, SPREADSHEET_ID, SHEET_NAME);

    if (!salesData || salesData.length === 0) {
      Logger.log('No se encontraron datos de ventas para el d\u00eda ' + formattedReportDate + '. No se enviar\u00e1 el reporte.');
      // Opcional: Podr\u00edas enviar un email de notificaci\u00f3n de "sin datos" aqu\u00ed.
      return;
    }
    Logger.log(Se encontraron ${salesData.length} registros de ventas para el d\u00eda.);

    // 3. Procesar y resumir los datos de ventas extra\u00eddos.
    const processedReportData = processSalesData(salesData);

    // 4. Generar el cuerpo HTML del reporte.
    const htmlReport = generateReportHtml(processedReportData, yesterday);

    // 5. Enviar el reporte por correo electr\u00f3nico.
    const emailSubject = REPORT_SUBJECT_PREFIX + formattedReportDate;
    sendEmailReport(RECIPIENT_EMAIL, emailSubject, htmlReport);

    Logger.log('Reporte de ventas diario enviado exitosamente.');

  } catch (error) {
    Logger.log('ERROR: Fall\u00f3 la ejecuci\u00f3n del reporte de ventas: ' + error.message);
    Logger.log('Stack: ' + error.stack);
    // Opcional: Enviar una notificaci\u00f3n de error a un administrador.
    // MailApp.sendEmail(
    //   'admin@ejemplo.com',
    //   'Alerta: Error en Reporte Diario de Ventas',
    //   'Se ha producido un error al generar el reporte de ventas: ' + error.message + '\n\n' + error.stack
    // );
  } finally {
    Logger.log('Finalizando el proceso de reporte de ventas diario.');
    Logger.log('----------------------------------------------------');
  }
}

/**
 * Calcula la fecha del d\u00eda anterior, ajust\u00e1ndola a medianoche (00:00:00)
 * para una comparaci\u00f3n consistente.
 * @returns {Date} Un objeto Date representando la medianoche del d\u00eda anterior.
 */
function getYesterdayDate() {
  const today = new Date();
  const yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);
  yesterday.setHours(0, 0, 0, 0); // Normalizar a medianoche para filtrar por fecha exacta
  return yesterday;
}

/**
 * Extrae y filtra los datos de ventas de Google Sheets para una fecha espec\u00edfica.
 * Se asume que la primera fila es de encabezados y la primera columna (columna A)
 * contiene las fechas de las ventas en formato de fecha v\u00e1lido.
 *
 * @param {Date} dateToFilter La fecha exacta (medianoche) para la cual se deben filtrar los datos.
 * @param {string} spreadsheetId El ID del Google Sheet.
 * @param {string} sheetName El nombre de la hoja que contiene los datos de ventas.
 * @returns {Array<Object>} Un array de objetos, donde cada objeto representa una fila de venta
 *                          con las claves como los nombres de los encabezados.
 * @throws {Error} Si la hoja especificada no se encuentra.
 */
function getSalesData(dateToFilter, spreadsheetId, sheetName) {
  const ss = SpreadsheetApp.openById(spreadsheetId);
  const sheet = ss.getSheetByName(sheetName);

  if (!sheet) {
    throw new Error(La hoja de c\u00e1lculo con nombre "${sheetName}" no fue encontrada en el ID: ${spreadsheetId}.);
  }

  const range = sheet.getDataRange();
  const values = range.getValues(); // Obtener todos los valores de la hoja.

  if (values.length === 0) {
    Logger.log('La hoja est\u00e1 vac\u00eda.');
    return [];
  }

  const headers = values[0]; // La primera fila son los encabezados.
  const dataRows = values.slice(1); // El resto son las filas de datos.

  const filteredData = dataRows.filter(row => {
    // Asegurarse de que la fila tiene suficientes columnas y que la primera es una fecha.
    if (row.length > 0 && row[0] instanceof Date) {
      const rowDate = new Date(row[0]);
      rowDate.setHours(0, 0, 0, 0); // Normalizar la fecha de la fila a medianoche.
      return rowDate.getTime() === dateToFilter.getTime();
    }
    return false;
  });

  // Mapear las filas de datos filtradas a objetos para un acceso m\u00e1s f\u00e1cil por nombre de columna.
  const salesObjects = filteredData.map(row => {
    let obj = {};
    headers.forEach((header, i) => {
      obj[header] = row[i];
    });
    return obj;
  });

  return salesObjects;
}

/**
 * Procesa un array de objetos de ventas para calcular res\u00famenes como
 * ventas totales, n\u00famero de transacciones, venta promedio y productos m\u00e1s vendidos.
 * Se asume que existen columnas como 'Producto', 'Cantidad' y 'Total Venta' en los objetos de venta.
 *
 * @param {Array<Object>} salesData Un array de objetos de venta, cada uno con sus propiedades.
 * @returns {Object} Un objeto que contiene los datos resumidos del reporte.
 */
function processSalesData(salesData) {
  let totalSales = 0;
  let transactionCount = salesData.length;
  let productsSold = {}; // {productName: quantitySold}

  salesData.forEach(sale => {
    // Sumar el 'Total Venta' si existe y es un n\u00famero.
    if (typeof sale['Total Venta'] === 'number') {
      totalSales += sale['Total Venta'];
    }

    // Contar productos vendidos por cantidad.
    if (sale['Producto'] && typeof sale['Cantidad'] === 'number') {
      const productName = String(sale['Producto']); // Asegurar que el nombre del producto es una cadena.
      productsSold[productName] = (productsSold[productName] || 0) + sale['Cantidad'];
    }
  });

  // Ordenar productos por cantidad vendida (descendente) y obtener los 5 primeros.
  const topProducts = Object.entries(productsSold)
    .sort(([, quantityA], [, quantityB]) => quantityB - quantityA)
    .slice(0, 5);

  return {
    totalSales: totalSales,
    transactionCount: transactionCount,
    averageSale: transactionCount > 0 ? totalSales / transactionCount : 0,
    topProducts: topProducts,
    allSales: salesData // Incluir todos los datos para una tabla de detalles en el reporte.
  };
}

/**
 * Genera el cuerpo HTML para el correo electr\u00f3nico del reporte de ventas.
 * Incluye un resumen, los productos m\u00e1s vendidos y una tabla detallada de transacciones.
 *
 * @param {Object} reportData Datos resumidos y detallados del reporte.
 * @param {Date} reportDate La fecha para la cual se gener\u00f3 el reporte.
 * @returns {string} Una cadena HTML bien formateada para el cuerpo del email.
 */
function generateReportHtml(reportData, reportDate) {
  const formattedDate = Utilities.formatDate(reportDate, Session.getScriptTimeZone(), 'dd/MM/yyyy');
  let html = 
    <html>
    <head>
      <style>
        body { font-family: 'Arial', sans-serif; color: #333; line-height: 1.6; }
        .container { max-width: 600px; margin: 20px auto; border: 1px solid #e0e0e0; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .header { background-color: #4CAF50; color: white; padding: 20px; text-align: center; }
        .header h1 { margin: 0; font-size: 28px; }
        .header p { margin-top: 5px; font-size: 16px; opacity: 0.9; }
        .content { padding: 25px; background-color: #ffffff; }
        h2 { color: #333; border-bottom: 2px solid #f0f0f0; padding-bottom: 10px; margin-top: 30px; font-size: 22px; }
        h2:first-of-type { margin-top: 0; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; border: 1px solid #ddd; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f8f8f8; font-weight: bold; color: #555; }
        .summary-item { margin-bottom: 8px; font-size: 16px; }
        .summary-value { font-weight: bold; color: #007bff; }
        .footer { margin-top: 30px; font-size: 0.9em; color: #777; text-align: center; padding: 15px; border-top: 1px solid #eee; background-color: #f9f9f9; }
      </style>
    </head>
    <body>
      <div class="container">
        <div class="header">
          <h1>Reporte de Ventas Diarias</h1>
          <p>Fecha del Reporte: ${formattedDate}</p>
        </div>
        <div class="content">
          <h2>Resumen del D\u00eda</h2>
          <div class="summary-item">Ventas Totales: <span class="summary-value">$${reportData.totalSales.toFixed(2)}</span></div>
          <div class="summary-item">N\u00famero de Transacciones: <span class="summary-value">${reportData.transactionCount}</span></div>
          <div class="summary-item">Venta Promedio por Transacci\u00f3n: <span class="summary-value">$${reportData.averageSale.toFixed(2)}</span></div>

          <h2>Productos M\u00e1s Vendidos (Top 5 por Cantidad)</h2>
          <table>
            <thead>
              <tr>
                <th>Producto</th>
                <th>Cantidad Vendida</th>
              </tr>
            </thead>
            <tbody>
  ;

  if (reportData.topProducts && reportData.topProducts.length > 0) {
    reportData.topProducts.forEach(([product, quantity]) => {
      html += <tr><td>${product}</td><td>${quantity}</td></tr>;
    });
  } else {
    html += <tr><td colspan="2">No hay datos de productos vendidos para mostrar.</td></tr>;
  }

  html += 
            </tbody>
          </table>

          <h2>Detalle de Transacciones</h2>
          <table>
            <thead>
              <tr>
                <th>Fecha</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Total Venta</th>
              </tr>
            </thead>
            <tbody>
  ;

  // Asumiendo columnas 'Date', 'Product', 'Quantity', 'Price', 'Total Sale'
  if (reportData.allSales && reportData.allSales.length > 0) {
    reportData.allSales.forEach(sale => {
      const saleDate = sale['Date'] ? Utilities.formatDate(new Date(sale['Date']), Session.getScriptTimeZone(), 'HH:mm') : 'N/A';
      html += 
              <tr>
                <td>${saleDate}</td>
                <td>${sale['Producto'] || 'N/A'}</td>
                <td>${sale['Cantidad'] || 0}</td>
                <td>$${(sale['Precio Unitario'] || 0).toFixed(2)}</td>
                <td>$${(sale['Total Venta'] || 0).toFixed(2)}</td>
              </tr>
      ;
    });
  } else {
    html += <tr><td colspan="5">No hay transacciones detalladas para mostrar.</td></tr>;
  }

  html += 
            </tbody>
          </table>
        </div>
        <div class="footer">
          <p>Este es un reporte autom\u00e1tico generado por Google Apps Script.</p>
          <p>Por favor, no responda a este correo.</p>
        </div>
      </div>
    </body>
    </html>
  ;

  return html;
}

/**
 * Envia un correo electr\u00f3nico utilizando el servicio de Gmail de Apps Script.
 *
 * @param {string} to La(s) direcci\u00f3n(es) de correo del destinatario. Puede ser una lista separada por comas.
 * @param {string} subject El asunto del correo electr\u00f3nico.
 * @param {string} htmlBody El contenido HTML del cuerpo del correo.
 */
function sendEmailReport(to, subject, htmlBody) {
  Logger.log(Enviando email a: ${to} con asunto: "${subject}");
  GmailApp.sendEmail(to, subject, '', { htmlBody: htmlBody }); // El tercer argumento es el cuerpo de texto plano, se deja vac\u00edo al usar htmlBody.
  Logger.log('Email de reporte enviado correctamente.');
}