$(() => {
    const $runner = $("#runner");
    if ($runner.length) {
        const exercises = $runner.data("exercises");

        let ticker;
        let exIndex = 0;
        let current = exercises[exIndex];
        let timeLeft = current.duration;
        let resting = false;
        let running = false;
        let tick = document.getElementById("tick-sound");
        tick.volume = 0.3;
        let switchSound = document.getElementById("switch");
        switchSound.volume = 0.6;

        $("#start").on("click", runWorkout);
        $("#pause").on("click", pauseWorkout);
        render();

        function pauseWorkout() {
            running = false;
            clearInterval(ticker);
        }

        function runWorkout() {
            if (running) {
                return;
            }

            running = true;
            ticker = setInterval(() => {
                tick.play();

                if (timeLeft <= 0) {
                    switchSound.play();
                    if (!resting && current.rest && current.rest > 0) {
                        resting = true;
                        timeLeft = current.rest;
                    } else {
                        resting = false;
                        ++exIndex;
                        if (exIndex === exercises.length) {
                            clearInterval(ticker);
                        }

                        current = exercises[exIndex];
                        timeLeft = current.duration;
                    }
                }

                render();

                --timeLeft;
            }, 1000);
        }

        function render() {
            $runner.html(`<div>
                <h2 class="title">${resting ? "Resting" : current.name}</h2>
                <p class="subtitle">${timeLeft}</p>
            </div>`);
        }
    }
});
