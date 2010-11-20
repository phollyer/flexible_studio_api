package api.vos.ftp.chmod.members
{
	[Bindable]
	public class UserVO extends Object
	{
		public var execute:Boolean = true;
		public var read:Boolean = true;
		public var write:Boolean = true;
		
		public function UserVO()
		{
			super();
		}
		public function getString():String
		{
			var __val:Number = 0;
			switch( execute )
			{
				case true:
					__val = 1;
			}
			switch( read )
			{
				case true:
					__val += 4;
			}
			switch( write )
			{
				case true:
					__val += 2;
			}
			return String( __val );
		}		
	}
}