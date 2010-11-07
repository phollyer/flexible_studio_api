package api.ado.find
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.find.FindEvent;
	
	[Event(name="missingCriteria" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.ado.find.FindEvent")]
	[Bindable]
	public class Find extends Ado
	{
		public static const FIND_FIRST:String = "FindFirst";
		public static const FIND_NEXT:String = "FindNext";
		
		// Required
		public var criteria:String = null;
		
		// Optional
		public var mode:String = FIND_FIRST;
		
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function Find(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function find( findCriteria:String = null ):void
		{
			criteria = compareStrings( findCriteria , criteria );
			switch( criteria )
			{
				case null:
					missingCriteria();
					break;
				default:
					ssCore.Ado.find( {criteria:criteria , mode:mode}
									,{callback:actionComplete, errorSTR:"findError", code:"16002"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : FindEvent = new FindEvent( FindEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}