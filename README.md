# Picktochart - Acme-Widget-Co

This is a Ruby based system called Acme Widget Co designed to manage product sales, discounts, and delivery fees according to the specified criteria.

## 🛠️ Getting Started

### Prerequisites

- Ruby (version 2.7+ recommended)

### Install Dependencies

This project has no gem dependencies — it's just plain Ruby.

---


### Installation

Clone the repository to your local machine:

```
git clone https://github.com/your-username/acme-widget-sales.git
cd acme-widget-sales

```

Install dependencies (if any are required for testing):

```
gem install minitest

```

### Usage

1. Run the application:
  To interact with the sales system, simply run the command-line script main.rb. This will display the available products and prompt the user to add items to their basket.

  ```
    ruby main.rb
  
  ```

2. Run test cases:
   Unit tests for different parts of the system (e.g., Product, Catalogue, Offers, Delivery Rules) are provided. You can run them using:

   ```
     ruby -Ilib:test test/test_*.rb
   
   ```

## Code Structure

1. Product Class: Contains details about each product, such as code, title, and price.

2. Catalogue Class: Manages a collection of products and provides methods to search for a product by its code.

3. Basket Class: Manages a shopping basket, allowing products to be added and calculates the total cost including offers and delivery charges.

4. Offers Class: Contains discount offers that can be applied to products in the basket.

5. DeliveryDiscount Class: Calculates the delivery fee based on the total order value.


## Assumptions Made

1. Product Catalogue: The product catalogue consists of three products:

    - Red Widget (R01) - $32.95
    
    - Green Widget (G01) - $24.95
    
    - Blue Widget (B01) - $7.95

2. Offers: The only offer implemented is "Buy one Red Widget, get the second half off".

3. Delivery Cost Rules:

    - Orders under $50 incur a $4.95 delivery fee.
    
    - Orders between $50 and $90 incur a $2.95 delivery fee.
    
    - Orders of $90 or more have free delivery.

4. Input Validation: When adding products to the basket, the system ensures the correct product codes are used. If the code is invalid, an error message is shown.

### Testing

The project includes several test cases written using the Minitest framework. The tests cover:

  1. Product: Verifying correct initialization and attributes.
  
  2. Catalogue: Ensuring products can be correctly retrieved by their code.
  
  3. Offer: Ensuring that offers are applied correctly to eligible products.
  
  4. Delivery Discount: Ensuring the correct delivery charge is calculated based on the total basket value.
     
  5. Basket: Ensure that add product funcationality works fine and total cart price is calculated correctly.


### Sample for Command Line Interface:
<img width="1013" alt="image" src="https://github.com/user-attachments/assets/c901acc7-7c27-4ba5-8c32-6e9a66440db7" />



