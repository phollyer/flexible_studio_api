package api.ado.setConnectString
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Event(name="missingString" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetConnectString extends Ado
	{
		// Required
		public var connectString:String = null;
		
		public function SetConnectString(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setConnectString( adoConnectString:String = null ):void
		{
			connectString = compareStrings( adoConnectString , connectString );
			switch( connectString )
			{
				case null:
					missingString();
					break;
				default:
					ssCore.Ado.setConnectString( {connectString:connectString}
												,{callback:actionComplete, errorSTR:"setConnectStringError", code:"16018"} );
			}
		}
	}
}