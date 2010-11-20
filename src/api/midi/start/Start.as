package api.midi.start
{
	import flash.events.IEventDispatcher;
	import api.midi.Midi;

	[Bindable]
	public class Start extends Midi
	{
		// Optional
		public var id:Number = 0;
		
		public function Start(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function start():void
		{
			ssCore.Midi.start( {id:id}
							  ,{callback:actionComplete, errorSTR:"startError", code:"28003"} );
		}
	}
}