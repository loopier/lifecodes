+ Color {
	asCmdArgs { ^"% % %".format(this.red, this.green, this.blue)}
	difference { |color|
		^Color(
			this.red - color.red,
			this.green - color.green,
			this.blue - color.blue,
		)
	}
}
