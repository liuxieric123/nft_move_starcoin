function lo(index) {
	let cell_size_list = [5, 10, 15, 25, 50, 150];
	let noise_size_list = [0.001, 0.01, 0.1, 1, 10];
	let noise_radius_list = [0.01, 0.1, 0.3, 1];
	let sketch = function(p) {
		let width = 1200;
		let height = 1200;
		let offset = -40;
		const grid_dim_x = 1200;
			const grid_dim_y = 1200;
			const padding = 40;
			const canvas_dim_x = grid_dim_x + 2 * padding;
			const canvas_dim_y = grid_dim_y + 2 * padding;

		let flow_cell_size = cell_size_list[index % 5];
		let noise_size = noise_size_list[index % 6];
		let noise_radius = noise_radius_list[index % 4];
		let filename = String(index) + '_' + String(flow_cell_size) + '_' + 
					   String(noise_size) + '_' + String(noise_radius) + '.jpg';
		let flow_width = (width + offset * 2) / flow_cell_size;
		let flow_height = (height + offset * 2) / flow_cell_size;

		let noise_grid = [];
		let flow_grid = [];

		let palette;

		let noise_offset_x, noise_offset_y;

		let tick = 0;
		let c;
		p.noiseSeed(index);
		p.randomSeed(index);
		p.setup = function() {
			c = p.createCanvas(canvas_dim_x, canvas_dim_y);
			p.smooth();
			p.noLoop();

			p.strokeWeight(1);
			p.fill(0);
			p.noStroke();
			noise_offset_x = p.random(10);
			noise_offset_y = p.random(10);
			// noise_offset_x = 0;
			// noise_offset_y = 0;

			palette = [
			p.color(0, 255, 159),
			p.color(0, 184, 255),
			p.color(0, 30, 255),
			p.color(189, 0, 255),
			p.color(214, 0, 255)
			];
			palette = shuffleArray(palette, index);
			  
			init_flow();
		};
		p.draw = function() {
			p.background(9, 24, 51);
			p.translate(-offset, -offset);
			for (var i = 0; i < palette.length; i++) {
			init_flow();
			display_flow(i);
			}
			tick++;
		p.save(c, filename);
		};
		//   p.save('my.jpg');

		function init_flow() {
			flow_grid = [];
			for (let i = 0; i < flow_height; i++) {
			let row = [];
			for (let j = 0; j < flow_width; j++) {
				row.push(calculate_flow2(j * noise_size, i * noise_size, noise_radius));
			}
			flow_grid.push(row);
			}
		}

		function shuffleArray(array, index) {
			let num = index % 5;
			let length = array.length;
			let temp = array.slice(num, length);
			let back = array.slice(0, num);
			array = temp.concat(back);
				
			return array;
		 }

		function calculate_flow(x, y, r) {
			let high_val = 0;
			let low_val = 1;
			let high_pos = p.createVector(0, 0);
			let low_pos = p.createVector(0, 0);

			for (var i = 0; i < 30; i++) {
			let angle = p.random(p.TAU);
			let pos = p.createVector(x + p.cos(angle) * r, y + p.sin(angle) * r);
			let val = p.noise(noise_offset_x + pos.x, noise_offset_y + pos.y);

			if (val > high_val) {
				high_val = val;
				high_pos.x = pos.x;
				high_pos.y = pos.y;
			}
			if (val < low_val) {
				low_val = val;
				low_pos.x = pos.x;
				low_pos.y = pos.y;
			}
			}

			let flow_angle = p.createVector(low_pos.x - high_pos.x, low_pos.y - high_pos.y);
			flow_angle.normalize().mult((high_val - low_val) / noise_radius);
			return { arrow: flow_angle, point: p.noise(x, y) };
		}

		function calculate_flow2(x, y, r) {
			let diff = 0;
			let max_diff = 0;
			let low_pos = p.createVector(0, 0);
			let high_pos = p.createVector(0, 0);
			p.noiseSeed(index);

			for (var i = 0; i < 30; i++) {
			let angle = p.random(p.TAU);
			//   let angle = 50;
			let pos1 = p.createVector(x + p.cos(angle) * r, y + p.sin(angle) * r);
			let pos2 = p.createVector(x + p.cos(angle + p.PI) * r, y + p.sin(angle + p.PI) * r);

			let val1 = p.noise(noise_offset_x + pos1.x, noise_offset_y + pos1.y);
			let val2 = p.noise(noise_offset_x + pos2.x, noise_offset_y + pos2.y);

			diff = p.abs(val2 - val1);

			if (diff > max_diff) {
				max_diff = diff;
				if (val1 < val2) {
				low_pos.x = pos1.x;
				low_pos.y = pos1.y;
				high_pos.x = pos2.x;
				high_pos.y = pos2.y;
				} else {
				low_pos.x = pos2.x;
				low_pos.y = pos2.y;
				high_pos.x = pos1.x;
				high_pos.y = pos1.y;
				}
			}
			}

			let flow_angle = p.createVector(low_pos.x - high_pos.x, low_pos.y - high_pos.y);
			flow_angle.normalize().mult(1.4 * max_diff / noise_radius);
			return { arrow: flow_angle, point: p.noise(x, y) };
		}

		function display_flow(col) {
			for (let i = 0; i < flow_grid.length; i++) {
			for (let j = 0; j < flow_grid[i].length; j++) {
				p.stroke(palette[col]);
				p.line(
				j * flow_cell_size + 50,
				i * flow_cell_size + 50,
				j * flow_cell_size + flow_grid[i][j].arrow.x * flow_cell_size * 1.6 + 50,
				i * flow_cell_size + flow_grid[i][j].arrow.y * flow_cell_size * 1.6 + 50
				);
			}
			}
		}

		p.keyPressed = function() {
			if (p.keyCode === 80) {
			p.saveCanvas('noise_grid', 'jpeg');
			}
		};
	};
	return sketch
}

let start_index = 1;
let end_index = 11;

for (let i = start_index; i < end_index; i++) {
	let s = lo(i);
	new p5(s);
}
