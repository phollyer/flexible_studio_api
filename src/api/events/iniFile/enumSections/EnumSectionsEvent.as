package api.events.iniFile.enumSections
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class EnumSectionsEvent extends IniFileEvent
	{
		
	/**
	* The EnumSectionsEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>sections</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var sections:Array = null;
		
		public function EnumSectionsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnumSectionsEvent = new EnumSectionsEvent( type );
			e.sections = sections;
			return e;
		}
	}
}