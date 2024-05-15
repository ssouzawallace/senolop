# Senolop: RPN Calculator

Welcome to Senolop, a powerful Reverse Polish Notation (RPN) calculator! This calculator allows you to perform mathematical operations using the classic postfix notation. With its intuitive stack-based approach, Senolop offers a unique way to solve complex equations.

## Features
- Efficient and easy-to-use RPN calculator
- Supports basic arithmetic operations: addition, subtraction, multiplication, and division
- Performs calculations using a stack-based mechanism
- Error handling for incorrect inputs and division by zero
- Memory functionality with a built-in memory stack
- Customizable precision settings for accurate calculations

## Installation
Senolop is a command-line application written in Python. To use it, make sure you have Python 3.x installed on your system. Follow these steps to install Senolop:

1. Clone the repository:
```shell
git clone https://github.com/ssouzawallace/senolop.git
```
2. Change into the project directory:
```shell
cd senolop
```
3. Run the application:
```shell
xcrun Senolop.xcproj
```

## Usage
Senolop provides a simple and efficient way to perform calculations using RPN notation. Follow these guidelines to start using Senolop:

1. Enter numbers and operators in the desired order, separated by spaces.
   - **Example:** To calculate `4 + (7 - 2) * 5`, enter `4 7 2 - 5 * +`.

2. Press Enter to display the result.

3. Senolop will evaluate the expression and provide the output.

4. The calculator supports the following operators: `+`, `-`, `*`, and `/`.

5. To clear the stack, type `clear` or press Enter without entering any input.

6. To store a number in memory, use the `sto` command followed by the memory slot number and the number to be stored.
   - **Example:** `sto 1` saves the top element from the stack to memory slot 1.

7. To recall a number from memory, use the `rcl` command followed by the memory slot number.
   - **Example:** `rcl 1` retrieves the value stored in memory slot 1 and pushes it to the stack.

8. To change the precision settings, use the `precision` command followed by the desired number of decimal places.
   - **Example:** `precision 4` configures Senolop to display results with four decimal places.

## Examples
- Addition:
  - Input: `5 2 +`
  - Output: `7`

- Subtraction:
  - Input: `9 3 -`
  - Output: `6`

- Multiplication:
  - Input: `4 5 *`
  - Output: `20`

- Division:
  - Input: `10 2 /`
  - Output: `5`

- Mixed operations:
  - Input: `4 3 * 8 2 + /`
  - Output: `0.5714`

- Storing and recalling from memory:
  - Input: `7 3 + sto 1 rcl 1 -`
  - Output: `7`

## Contributing
Contributions are always welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on the [Senolop GitHub repository](https://github.com/your-username/senolop).

## License
This project is licensed under the MIT License. See [LICENSE](https://github.com/your-username/senolop/blob/main/LICENSE) for more information.

## Acknowledgements
- This project was inspired by the concept of Reverse Polish Notation (RPN) calculators.
- Special thanks to the contributors of the following libraries used in this project:
  - [Python](https://www.python.org/)
  - [Markdown](https://daringfireball.net/projects/markdown/)

## Contact
For any inquiries or feedback, please contact the project maintainer at [ssouza.wallace@gmail.com](mailto:ssouza.wallace@gmail.com).

Enjoy calculating with Senolop, and may your RPN expressions always yield fruitful results!

[Help Wanted]!
