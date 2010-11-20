package api.midi.start
{
	import api.events.midi.start.StartEvent;

	import api.midi.Midi;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_start.html Northcode Help Documentation
	*/
	public class Start extends Midi
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var id:Number = 0;
		
		/**
		* Constructor for Midi.Start()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_start.html Northcode Help Documentation
		*/
		public function Start(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_start.html Northcode Help Documentation
		*/
		public function start():void
		{
			ssCore.Midi.start( {id:id}
							  ,{callback:actionComplete, errorSTR:"startError", code:"28003"} );
		}
	}
}