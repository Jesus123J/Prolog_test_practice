//
//var product;
//
// async  function componentAsync() {
//    //El  clase fetch  es una libreria propia de javascript hace una promesa en el cual  espera la respusta
//    // method diferentes tipos :
//    //GET es de atraer 
//    //POST es de enviar algo
//
//    const responsesEmployee = await fetch('http://localhost:9091/boss/product/list',
//            {
//                method:'GET',
//                headers: {
//                    'Content-type' :  'application/json',
//                    'Authorization' : 'eyJpZEFjY291bnQiOjIsImlkUGVyc29uIjoyLCJzdGF0dXMiOjEsInVzZXJuYW1lIjoiamVzdXN0aGlhZ29AZ21haWwuY29tIiwibmFtZSI6IkpFU1VTIiwibGFzdG5hbWUiOiJUSElBR08iLCJtb3RoZXJMYXN0bmFtZSI6IlRPUlJFUyIsImlkUm9sZSI6Miwicm9sZVR5cGUiOiJKRUZFIn0='
//                }
//            }
//    );
//    const responseJson = await responsesEmployee.json(); 
//    product = responseJson.bossProducts;
//    
//    product.forEach(element => {
//        console.log(element.productName);
//    });
//
//  
//   // responseJson.bossProducts.array.forEach(element => {
//   //         console.log(element.productName);
//   // });
//}
//
//async function main() {
//    await componentAsync();
//
//    console.log('Product:', product);
//}
//
//// Llamar a la función principal
//main();




async function get(){
   
    const response = await fetch('http://localhost/ServerPhp/RequestPHP.php', 
        {
            method: 'GET',
            headers: {
                'Content-Type' : 'application/json'
            }
         });

         const responseJson = await response.json();

         console.log(responseJson.code);
}



get();