document.addEventListener('DOMContentLoaded', function() {
    fetch('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/Game%20Status.lua')
        .then(response => response.text())
        .then(data => {
            // Extract game statuses from Lua-like text
            let gameStatuses = {};
            let lines = data.split('\n');
            lines.forEach(line => {
                let match = line.match(/R3THPRIVV1_(\w+)\s*=\s*"(\w+)"/);
                if (match) {
                    let gameName = match[1];
                    let status = match[2];
                    gameStatuses[gameName] = status;
                }
            });

            // Populate the table with game statuses
            let tableBody = document.getElementById('gameStatusBody');
            Object.keys(gameStatuses).forEach(game => {
                let row = tableBody.insertRow();
                let cellGame = row.insertCell(0);
                let cellStatus = row.insertCell(1);
                cellGame.innerText = game;
                cellStatus.innerText = gameStatuses[game];
            });
        })
        .catch(error => console.error('Error fetching game status:', error));
});
