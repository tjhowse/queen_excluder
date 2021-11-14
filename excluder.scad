// An excluder that goes over the entrance to a bee hive that prevents a queen leaving (or entering, I guess?)
// Useful for a capturing a swarm, as the rest of the bees won't leave without their queen.
// Printed in two parts to fit on my 200x200 bed. The height of the excluder is set in order
// to have three rows of slots, not by how high my entrance actually is. Don't @ me.
// On my printer, with a reasonably well-calibrated Z height, I can confirm that worker bees
// can pass through the grid.

slot_x = 20;
slot_y = 4.4; // Theoretically too small for a queen to get through, but big enough for a worker.
wt = 2;

entrance_z = 4*wt+3*slot_y;
// entrance_z = 21.5; // Reality
echo(entrance_z); // Echoed
// entrance_x = 356; // Actual width of the entrance
entrance_x = 356/2; // Halved so it fits on my bed.

module holes() {
    for ( j = [0 : slot_y+wt : entrance_z] ) {
        for ( i = [0 : slot_x+wt : entrance_x] ) {
            if (((j/(slot_y+wt)) % 2) == 0) {
                translate([i+wt,j+wt,0]) cube([slot_x, slot_y, 100]);
            } else {
                translate([i-(slot_x+wt)/2+wt,j+wt,0]) cube([slot_x, slot_y, 100]);
            }
        }
    }
}

module excluder() {
    difference() {
        cube([entrance_x, entrance_z, wt]);
        holes();
    }
}

excluder();
translate([0,25,0]) excluder();