import * as Swing from "swing";

const swipe = () => {
  const namecards = document.querySelector(".name-cards")
  if(namecards) {
    // console.log(namecards)
    // Prepare the cards in the stack for iteration.
    const cards = [namecards];

    // An instance of the Stack is used to attach event listeners.
    const stack = Swing.Stack({
      allowedDirections: [Swing.Direction.LEFT, Swing.Direction.RIGHT]
    });

    cards.forEach((targetElement) => {
      // Add card element to the Stack.
      stack.createCard(targetElement);
    });

    // Add event listener for when a card is thrown out of the stack.
    stack.on('throwout', (event) => {
      // e.target Reference to the element that has been thrown out of the stack.
      // e.throwDirection Direction in which the element has been thrown (Direction.LEFT, Direction.RIGHT).

      console.log('Card has been thrown out of the stack.');
      console.log('Throw direction: ' + (event.throwDirection == Swing.Direction.LEFT ? 'left' : 'right'));

      if (event.throwDirection == Swing.Direction.LEFT) {
        const decision = document.querySelector("#decline-btn");
        console.log('LEFT', decision);
        decision.click()
      }
        
      else if (event.throwDirection == Swing.Direction.RIGHT) {
        const decision = document.querySelector("#accept-btn");
        console.log('RIGHT', decision);
        decision.click()
      }
    });
  };
}
export {swipe};
