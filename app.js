async function fetchProducts() {
    const loadingOverlay = document.getElementById('loadingOverlay');
    const productsElement = document.getElementById('products');

    try {
        // Mostrar el indicador de "cargando"
        loadingOverlay.style.display = 'flex';

        const responsesEmployee = await fetch('http://localhost:9091/boss/product/list',
            {
                method:'GET',
                headers: {
                    'Content-type' :  'application/json',
                    'Authorization' : 'eyJpZEFjY291bnQiOjIsImlkUGVyc29uIjoyLCJzdGF0dXMiOjEsInVzZXJuYW1lIjoiamVzdXN0aGlhZ29AZ21haWwuY29tIiwibmFtZSI6IkpFU1VTIiwibGFzdG5hbWUiOiJUSElBR08iLCJtb3RoZXJMYXN0bmFtZSI6IlRPUlJFUyIsImlkUm9sZSI6Miwicm9sZVR5cGUiOiJKRUZFIn0='
                }
            }
    );
        // Convertir la respuesta a JSON y esperar a que se resuelva
        const responseJson = await responsesEmployee.json();
        const products = responseJson.bossProducts;
        console.log(responseJson);
        // Limpiar cualquier contenido previo
        productsElement.innerHTML = '';
        await sleep(5000); // Recorrer cada producto en bossProducts y agregarlo al DOM
        products.forEach(product => {
            const productElement = document.createElement('div');
            productElement.innerHTML = `
                <h3>${product.productName}</h3>
                <p>Código: ${product.productCode}</p>
                <p>Precio: $${product.productPrice}</p>
            `;
            productsElement.appendChild(productElement);
        });
       
        // Ocultar el indicador de "cargando"
        loadingOverlay.style.display = 'none';
    } catch (error) {
        console.error('Error al obtener los productos:', error);
        loadingOverlay.innerText = 'Error al cargar productos.';
    }
}

// Llamar a la función fetchProducts cuando se carga la página
window.onload = fetchProducts;
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}