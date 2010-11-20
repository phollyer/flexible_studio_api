package api.email.send
{
	import flash.events.IEventDispatcher;
	
	import api.email.EMail;
	import api.errors.EMailError;
	import api.vos.email.SendVO;
	
	[Event(name="missingToAddress" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.email.send.SendEvent")]
	[Bindable]
	public class Send extends EMail
	{
		// Required
		public var sendSettings:SendVO = new SendVO();
		
		// Result
		public var serverResponse:String = null;
		
		public function Send(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function send( sendToAddress:String = null ):void
		{
			sendSettings.toAddress = compareStrings( sendToAddress , sendSettings.toAddress );
			switch( sendSettings.toAddress )
			{
				case null:
					missingToAddress();
					break;
				default:
					var __o : Object = sendSettings.createEmail();
					ssCore.EMail.send( __o , {callback:actionComplete, errorSTR:"sendError", code:"20000"} );
			}
		}
		public function sendComplete( r:Object , c:Object , e:Object ):void
		{
			switch( r.success )
			{
				case true:
					var event : SendEvent = new SendEvent( SendEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "20000";
					dispatchError( EMailError.SEND_ERROR , e );
			}
		}
		public function sendResult( r:Object ):void
		{
			serverResponse = r.result;
			
			var e : SendEvent = new SendEvent( SendEvent.RESULT );
			e.serverResponse = serverResponse;
			dispatchEvent( e );
		}
	}
}