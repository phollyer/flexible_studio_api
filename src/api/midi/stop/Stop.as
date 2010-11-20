package api.midi.stop
{
	import flash.events.IEventDispatcher;
	import api.midi.Midi;

	[Bindable]
	public class Stop extends Midi
	{
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stop():void
		{
			ssCore.Midi.stop( {}
							 ,{callback:actionComplete, errorSTR:"stopError", code:"28004"} );
		}
	}
}