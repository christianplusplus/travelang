Object.assign(tables, {
    monster : [
        () => new Monster('Goblin'),
        () => new Monster('Zombie'),
    ],
});

class Monster {

    constructor(name) {
        this.name = name;
    }
    
    toString() {
        return this.name;
    }

}