package api.midi.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.midi.notifiers.ClearNotifyEvent;
	import api.midi.Midi;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Midi
	{
		// Required
		public var event:String = null;
		
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearNotify( notificationEvent:String = null ):void
		{
			event = compareStrings( notificationEvent , event );
			
			switch( event )
			{
				case null:
					missingEvent();
					break;
				default:
					ssCore.Midi.clearNotify( {event:event}
											,{callback:actionComplete, errorSTR:"clearNotifyError", code:"28001"} );
			}
		}
	}
}